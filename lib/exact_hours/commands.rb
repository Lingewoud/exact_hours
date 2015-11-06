require 'csv'
require 'yaml'
require 'pp'
require 'text-table'

module ExactHours
  class Commands < Thor
    class_option :verbose, :desc => 'Be more verbose', :type => :boolean, :aliases => '-v'

    def initialize(*args)
      super
      #@@verbose = true if options[:verbose]
    end

    desc "version", "display version"
    def version
      print ExactHours::VERSION + "\n"
    end

    desc "prepare_for_import [weekfile]", "convert weekfile to csv for exact import"
    def prepare_for_import(weekfile)

      clients_ids = get_clients weekfile

      year,week_num = get_date_from_weekfile weekfile

      weekdata = YAML.load_file(weekfile)

      table = Text::Table.new
      table.head = ['Account','Date','Employee','Item','Notes','Project','Quantity']


      weekdata["days"].each do | day, blocks |

        blocks.each do | block |
          table.rows << [clients_ids[block['client']], get_date(year, week_num, day), weekdata['employee'], block['type'],block['note'], block['project'], block['qty']]
        end

      end

      print table.to_s


      csv_string = CSV.generate force_quotes: false ,  col_sep: ";" do |csv|

        table.rows.each do | row |
          csv << row
        end
      end

      csvfile = File.join File.dirname(weekfile), 'exact_hours.csv'
      File.open(csvfile, "wb") do |f|
        f.write(csv_string)
      end

    end


    private

    def get_date_from_weekfile(weekfile)
      p weekfile
      raise "Week file does not exist" unless File.exists? weekfile
      arr = File.basename(weekfile).split('.')
      [arr[1].to_i, arr[2].to_i]
    end

    def get_date( year, week_num , day)
      week_start = Date.commercial( year, week_num, DateTime.parse(day).wday )
      week_start.strftime( "%d-%m-%Y" )
    end

    def get_clients weekfile

      clientsfile = File.join File.dirname(weekfile), 'clients'
      raise "Clients does not exist" unless File.exists? clientsfile


      vars = {}
      IO.foreach(clientsfile) do |line|
        #discard comment lines
        if line.match(/^#/)
          next
        elsif
          #discard a blank line
          line.match(/^$/)
          next
        else
          temp = []

          temp[0],temp[1] = line.gsub(/\s+/m, ' ').strip.split(" ")

          vars[temp[1]] = temp[0]
        end
      end

      return vars

    end
  end
end
