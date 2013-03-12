actions :create, :remove

def initialize(*args)
  super
  @action = :create
end

attribute :name,
  :kind_of => String,
  :name_attribute => true

attribute :cookbook,
  :kind_of => String

attribute :source,
  :kind_of => String
