Factory.sequence :task_title do |n|
  "task title #{n}"
end

Factory.define :task do |t|
  t.title { Factory.next(:task_title) }
end
