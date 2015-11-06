require 'test_helper'

class TestExactHoursCLI < Minitest::Test

  def setup
  end

  def test_version
    assert_equal ExactHours::VERSION+"\n", run_thor_capture(['version'])
  end

  def test_prepare
#    run_thor_capture ['prepare_for_import', '']
    run_thor ['prepare_for_import', '/Users/pim/Desktop/Uren hervorming Exact/weekimports/week.2015.45.yml']

#    assert_match(/uploadasadmin_yes/, out2)
  end

  private

  def run_thor(args)
  #  args << '--verbose'
    ExactHours::Commands.start(args)
  end

  def run_thor_capture(args)
  #  args << '--verbose'
    out, _  = capture_io do
      ExactHours::Commands.start(args)
    end
    out
  end

end
