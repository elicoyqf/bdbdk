#encoding: utf-8

namespace :database do
  desc '将每个月的数据导入数据库中进行计算'
  task :excel2db => :environment do
    anlyze_db = AnaylzeData::ExcelProcess.new
    anlyze_db.excel_to_db

  end







end