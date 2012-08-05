class Record < ActiveRecord::Base
  attr_accessible :comment, :count, :disposition, :dkim, :dkim, :dkim_domain, :dkim_hresult, :dkim_result, :header_from, :report_id, :source_ip, :spf, :spf_domain, :spf_result, :type

  belongs_to :report
end