require 'spec_helper'

describe "tasks/new.html.haml" do
  before(:each) do
    assign(:task, stub_model(Task,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_title", :name => "task[title]"
      assert_select "textarea#task_body", :name => "task[body]"
    end
  end
end
