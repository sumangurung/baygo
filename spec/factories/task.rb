Factory.sequence :task_title do |n|
  "task title #{n}"
end

Factory.define :task do |t|
  t.title { Factory.next(:task_title) }
end

def define_coveys_factories(options = {})
  Factory.define options[:name], :class => Task do |fac|
    fac.title { Factory.next(:task_title) }
    fac.important(options[:important] || false )
    fac.urgent(options[:urgent] || false)
  end
end


# Creating factories for four quadrants
[
  {:quadrant => 1, :important => true, :urgent => true},
  {:quadrant => 2, :important => true, :urgent => false},
  {:quadrant => 3, :important => false, :urgent => true},
  {:quadrant => 4, :important => false, :urgent => false}
].each do |options|
  define_coveys_factories( options.merge(:name => "task_in_quadrant_#{options[:quadrant]}".to_sym))
end
