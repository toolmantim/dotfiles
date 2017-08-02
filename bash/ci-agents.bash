#!/bin/bash

# Scales up the CI without having to wait for new
# jobs to trigger a scale up.

moar_agents() {
  local how_many_scale_ups="2"

  echo -n "🏃‍♀️  Finding runners ASG name... " >&2
  local asg_name
  asg_name=$(
    aws-vault exec buildkite-dev -- \
      aws autoscaling describe-auto-scaling-groups \
        --region us-east-1 \
        --query 'AutoScalingGroups[?contains(AutoScalingGroupName,`runners`)].AutoScalingGroupName' \
        --output text
  )
  echo "$asg_name" >&2

  echo -n "🎢  Finding scale up policy name... " >&2
  local scale_up_policy_name
  scale_up_policy_name=$(
    aws-vault exec buildkite-dev -- \
      aws autoscaling describe-policies \
        --region us-east-1 \
        --query 'ScalingPolicies[?contains(PolicyName,`ScaleUp`)]'.PolicyName \
        --output text
  )
  echo "$scale_up_policy_name" >&2

  for i in $(seq 1 $how_many_scale_ups); do
    echo "📈  Executing scale up policy ($i of $how_many_scale_ups)..." >&2
    aws-vault exec buildkite-dev -- \
      aws autoscaling execute-policy \
        --region us-east-1 \
        --policy-name "$scale_up_policy_name" \
        --auto-scaling-group-name "$asg_name" \
        --no-honor-cooldown
  done
}