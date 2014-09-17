require_relative './mission_control'

filename = ARGV.first || 'test_input'
MissionControl.new.run_mission_from filename