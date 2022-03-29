region                           = "ap-northeast-2"
env                              = "ap-dev"
owner                            = "dcc"
s3_bucket_name                   = "ap-dev-pipeline-artifact"

############################ CodeBuild 
cb_name                          = "codebuild"
codebuild_timeout                = "10"
codebuild_envs                   = {
  compute_type    = "BUILD_GENERAL1_SMALL"
  image           = "aws/codebuild/standard:4.0"
  type            = "LINUX_CONTAINER"
  privileged_mode = true
}
codebuild_cache_type             = "LOCAL"
codebuild_cache_modes            = ["LOCAL_DOCKER_LAYER_CACHE"]
source_type                      = "CODEPIPELINE"
artifact_type                    = "CODEPIPELINE"
cb_tags                          = {}

############################ CodeBuild IAM
cb_trusted_role_services         = ["codebuild.amazonaws.com"]
cb_custom_role_policy_arns       = [
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess",
  "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
  "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
]

############################ CODEDEPLOY
cd_app_name                      = "codeDeploy-app"
cd_app_tags                      = {}
compute_platform                 = "ECS"
cd_group_name                    = "codeDeploy-group"
cd_group_tags                    = {}
cd_trusted_role_services         = ["codedeploy.amazonaws.com"]
cd_custom_role_policy_arns       = [
  "arn:aws:iam::aws:policy/AWSCodeDeployRoleForECS",
  "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
]
deployment_config_name           = "CodeDeployDefault.ECSAllAtOnce"
termination_wait_time_in_minutes = 0
// CodeDeployDefault.AllAtOnce : 모든 트래픽을 그린으로 한번에 전환
// CodeDeployDefault.HalfAtATime : 절반의 트래픽을 그린으로 전환
// CodeDeployDefault.ECSLinear10PercentEvery1Minutes : 분당 10%의 트래픽이 그린으로 전환
// CodeDeployDefault.ECSLinear10PercentEvery3Minutes
// CodeDeployDefault.ECSCanary10Percent5Minutes : 10%의 트래픽만 그린으로 전환 되고 5분 후 모두 전환
// CodeDeployDefault.ECSCanary10Percent15Minutes

############################ CODEPIPELINE
cpl_name                         = "codepipeline"
# GitHub
# suorce_provider                = "CodeStarSourceConnection"
GitHubFullRepositoryId           = "DACHANCHOI/test"
GitHubBranchName                 = "main"
ConnectionArn                    = "arn:aws:codestar-connections:ap-northeast-2:014842949473:connection/c36eec86-c7b6-4896-8115-5010f0497c9d"
# CodeCommit
suorce_provider                  = "CodeCommit"
CodeCommitRepositoryName         = "ap-dev-ecs-demo"
CodeCommitBranchName             = "master"
cpl_tags                         = {}

############################ CODEPIPELINE IAM
cpl_trusted_role_services        = ["codepipeline.amazonaws.com"]
cpl_custom_role_policy_arns      = [
  "arn:aws:iam::aws:policy/AmazonS3FullAccess",
  "arn:aws:iam::aws:policy/AWSCodeStarFullAccess",
  "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess",
  "arn:aws:iam::aws:policy/AWSCodeDeployFullAccess",
  "arn:aws:iam::aws:policy/AmazonECS_FullAccess",
  "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess"
]