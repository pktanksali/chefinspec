content = inspec.profile.file("aws_ecs.json")
params = JSON.parse(content)

cluster_name = params['clusters'][0]['clusterName']
status = params['clusters'][0]['status']
active_services_count = params['clusters'][0]['activeServicesCount']
pending_tasks_count = params['clusters'][0]['pendingTasksCount']
running_tasks_count = params['clusters'][0]['runningTasksCount']
registered_container_instances_count = params['clusters'][0]['registeredContainerInstancesCount']

describe aws_ecs_cluster(cluster_name: cluster_name) do
  it { should exist }
  its ('status') { should eq 'ACTIVE' }
  its ('active_services_count') { should eq active_services_count }
  its ('pending_tasks_count') { should eq 0 }
  its ('running_tasks_count') { should eq running_tasks_count }
  its ('registered_container_instances_count') { should eq registered_container_instances_count }
end

