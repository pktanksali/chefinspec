# Ensure that a topic exists and has at least one subscription
describe aws_sns_topic('arn:aws:sns:ap-southeast-1:710633926623:KACCD-JENKINS-BUILD') do
  it { should exist }
  its('confirmed_subscription_count') { should_not be_zero }
end

