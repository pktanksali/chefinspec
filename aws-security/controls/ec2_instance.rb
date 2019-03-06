content = inspec.profile.file("aws_ec2.json")
params = JSON.parse(content)

instance_name_0 = params['Reservations'][0]['Instances'][0]['InstanceId']
instance_type_0 = params['Reservations'][0]['Instances'][0]['InstanceType']
vpc_id_0 = params['Reservations'][0]['Instances'][0]['VpcId']
private_ip_address_0 = params['Reservations'][0]['Instances'][0]['PrivateIpAddress']
public_ip_address_0 = params['Reservations'][0]['Instances'][0]['PublicIpAddress']
image_id_0 = params['Reservations'][0]['Instances'][0]['ImageId']
security_group_ids_0 = [ params['Reservations'][0]['Instances'][0]['SecurityGroups'][0]['GroupId'] ]
subnet_id_0 = params['Reservations'][0]['Instances'][0]['SubnetId']

instance_name_1 = params['Reservations'][1]['Instances'][0]['InstanceId']
instance_type_1 = params['Reservations'][1]['Instances'][0]['InstanceType']
vpc_id_1 = params['Reservations'][1]['Instances'][0]['VpcId']
private_ip_address_1 = params['Reservations'][1]['Instances'][0]['PrivateIpAddress']
public_ip_address_1 = params['Reservations'][1]['Instances'][0]['PublicIpAddress']
image_id_1 = params['Reservations'][1]['Instances'][0]['ImageId']
security_group_ids_1 = [ params['Reservations'][1]['Instances'][0]['SecurityGroups'][0]['GroupId'] ]
subnet_id_1 = params['Reservations'][1]['Instances'][0]['SubnetId']

describe aws_ec2_instance(instance_name_0) do
  it { should exist }
  it { should be_running }
  its ('instance_type') { should eq instance_type_0 }
  its ('vpc_id') { should eq vpc_id_0 }
  its ('subnet_id') { should eq subnet_id_0 }
  its ('private_ip_address') { should eq private_ip_address_0 }
  its ('public_ip_address') { should eq public_ip_address_0 }
  its ('image_id') { should eq image_id_0 }
  its ('security_group_ids') { should eq security_group_ids_0 }
end

describe aws_ec2_instance(instance_name_1) do
  it { should exist }
  it { should be_running }
  its ('instance_type') { should eq instance_type_1 }
  its ('vpc_id') { should eq vpc_id_1 }
  its ('subnet_id') { should eq subnet_id_1 }
  its ('private_ip_address') { should eq private_ip_address_1 }
  its ('public_ip_address') { should eq public_ip_address_1 }
  its ('image_id') { should eq image_id_1 }
  its ('security_group_ids') { should eq security_group_ids_1 }
end


