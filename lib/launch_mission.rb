require_relative './mission_control'

def launch
	filename = ARGV.first || 'test_input'
	MissionControl.new.run_mission_from filename
end

launch