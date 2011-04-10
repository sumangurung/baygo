require 'spec_helper'

describe Task do
  subject { Factory.build(:task) }
  
  it { should be_valid }
  it { should validate_presence_of(:title) }

end
