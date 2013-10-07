#encoding : utf-8
require 'roo'
module AnaylzeData
  class ExcelProcess
    def excel_to_db
      book = Roo::Excel.new('g:/6.xls')

      puts book.sheets.size

      (1..(book.sheets.size-1)).each do |sheet|
        book.default_sheet = book.sheets[sheet]
        puts book.default_sheet
        #puts 'last row is :'+ book.last_row.inspect
        #puts 'first row is : ' + book.first_row.inspect
        unless book.last_row.blank?
          3.upto(book.last_row) do |line|
            dslam_ip       = book.cell(line, 'A')
            dslam_name     = book.cell(line, 'B')
            dslam_port     = book.cell(line, 'C')
            upstream       = book.cell(line, 'D')
            upstream_act   = book.cell(line, 'E')
            downstream     = book.cell(line, 'F')
            downstream_act = book.cell(line, 'G')
            account        = book.cell(line, 'H')
            #puts "#{date}\t#{source_node}\t#{source_node_arr}\t#{dest_node}\t#{homepage_load_time}\t#{total_time}\t#{throughput_rate}\t#{connect_success_rate}\t#{total}"
            #printf("%-30s|%-20s|%-20s|%-20s|%-20s|%-20s|%-20s|%-20s|%-20s|\n", date, source_node, source_node_arr, dest_node, homepage_load_time, total_time, throughput_rate, connect_success_rate, total)

            Bdbdk.create(city: book.default_sheet,test_time: Time.now, dslam_ip: "#{dslam_ip}", dslam_name: "#{dslam_name}", dslam_port: "#{dslam_port}", upstream: "#{upstream}", upstream_act: "#{upstream_act}", downstream: "#{downstream}", downstream_act: "#{downstream_act}", account: "#{account}")
          end
        end

      end


      #(0..(book.sheets.size)).each do |shet|
      #  book.default_sheet = book.sheets[shet]
      #  puts book.cell(shet, 'A')
      #end


      #book.last_row
      #2.upto(book.last_row) do |line|
      #  date                       = book.cell(line, 'A')
      #  source_node                = book.cell(line, 'B')
      #  source_node_arr            = book.cell(line, 'B').to_s.split(')')
      #  dest_node                  = book.cell(line, 'C')
      #  homepage_load_time         = book.cell(line, 'D')
      #  total_time                 = book.cell(line, 'E')
      #  throughput_rate            = book.cell(line, 'F')
      #  connect_success_rate       = book.cell(line, 'G')
      #  homepage_load_success_rate = book.cell(line, 'H')
      #  dest_host_ip               = book.cell(line, 'I')
      #  host_locale                = book.cell(line, 'J').to_s.split
      #  printf("%-20s|%-20s|%-10s|%-30s|%-20s|%-20s|%-20s|%-20s|%-20s|%-20s|%-10s|%-10s\n", date, source_node_arr[0]+')', source_node_arr[1].chop.chop,
      #          dest_node, homepage_load_time, total_time, throughput_rate, connect_success_rate, homepage_load_success_rate, dest_host_ip, host_locale[0],
      #          host_locale[1])
      #end
    end
  end
end