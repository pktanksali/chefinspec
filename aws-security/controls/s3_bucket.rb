describe aws_s3_bucket(bucket_name: 'kaccdpochexaartifacts') do
  it { should exist }
  it { should_not be_public }
  its('region') { should eq 'ap-southeast-1' }
end

#describe aws_s3_bucket_object(bucket_name: 'kaccdpochexaartifacts', key: 'ccdarchive') do
#  it { should exist }
#  it { should_not be_public }
#end
