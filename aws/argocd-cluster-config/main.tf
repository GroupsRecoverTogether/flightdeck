locals {
  name = join("-", concat(var.aws_namespace, [var.cluster_name]))

  argocd_cluster_config = {
    name   = local.name
    server = data.aws_eks_cluster.this.endpoint
    config = {
      awsAuthConfig = {
        clusterName = local.name
        roleARN     = aws_iam_role.argocd.arn
      }
      tlsClientConfig = {
        caData = data.aws_eks_cluster.this.certificate_authority[0].data
      }
    }
  }
}

resource "aws_iam_role" "argocd" {
  assume_role_policy = data.aws_iam_policy_document.argocd_assume_role.json
  name               = join("-", concat(var.aws_namespace, [var.cluster_name, "argocd"]))
  tags               = var.aws_tags
}

data "aws_iam_policy_document" "argocd_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.argocd_service_account_role_arn]
    }
  }
}

data "aws_eks_cluster" "this" {
  name = join("-", concat(var.aws_namespace, [var.cluster_name]))
}