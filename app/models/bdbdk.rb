class Bdbdk
  include Mongoid::Document
  include Mongoid::Timestamps

  field :city, type: String
  field :test_time, type: DateTime
  field :dslam_ip, type: String
  field :dslam_name, type: String
  field :dslam_port, type: String
  field :upstream, type: String
  field :upstream_act, type: String
  field :downstream, type: String
  field :downstream_act, type: String
  field :account, type: String
end
