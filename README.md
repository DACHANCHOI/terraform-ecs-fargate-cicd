# ecs-ci-cd-pipeline
## Introduction

Terraform 코드로 통한 AWS ECS & Code Series 프로비저닝

* #### **사전 준비사항**

  * Terraform Cloud or Terraform Open Source
  * AWS ECR Repository
  * [example container](https://github.com/cshift/example_ecs_service)

## Scenario
![스크린샷 2022-05-01 오후 3 43 28](https://user-images.githubusercontent.com/77256060/166135355-0ba4d45b-9712-4c50-8985-f15f7d79f43d.png)

1. Terraform으로 프로비저닝 ECS, ALB, CodePipeline, CodeBuild, CodeDeploy

2. CodePipeline Source Stage : GitHub 또는 CodeCommit 사용
   [환경변수 : suorce_provider](https://github.com/cshift/ecs-ci-cd-pipeline/blob/main/aws-cicd-pipeline/_terraform.auto.tfvars)

3. CodePipeline Build Stage : CodeBuild

4. CodePipeline Deploy Stage

   * Option #1 : CodePipeline 자체 배포
   * Option #2 : CodeDeploy를 통한 배포 (Recommand)
   [환경변수 : deployment_controller](https://github.com/cshift/ecs-ci-cd-pipeline/blob/main/ecs/terraform.auto.tfvars)

## Terraform Workspaces List (VPC, ECS, AWS-CICD/PIPELINE 세가지 워크스페이스 사용 권장)

1. [**VPC**](https://github.com/cshift/ecs-ci-cd-pipeline/tree/main/vpc) 
2. [**ECS**](https://github.com/cshift/ecs-ci-cd-pipeline/tree/main/ecs)(ECS Cluster, ECS Task Definition, ECS Service, ALB)
3. [**AWS-CICD/PIPELINE**](https://github.com/cshift/ecs-ci-cd-pipeline/tree/main/aws-cicd-pipeline)(Codebuild, CodeDeploy, CodePipeline, CodeStar, CodeCommit)
