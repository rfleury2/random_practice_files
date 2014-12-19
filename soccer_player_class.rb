class SoccerPlayer
  def initialize(first_name, last_name, position, position_side = "center")
    @first_name = first_name
    @last_name = last_name
    @shot_count = 0
    @goal_count = 0
    # Adjust according to the sideline
    @position_side = position_side
    position_side = -15 if position_side == "left"
    position_side = 15 if position_side == "right"
    position_side = 0 if position_side == "center"
    @position = position
    # Find base position
    @coordinate_position = case position.downcase
      when "forward"
        [80, 25 - position_side]
      when "midfield"
        [50, 25 - position_side]
      when "defender"
        [25, 25 - position_side]
      when "goalkeeper"
        [5, 25 - position_side]
      else p "#{position} is not a real position.  You screwed this thing up!"
    end
    p @coordinate_position
  end

  def shoot
    @shot_count += 1
    @goal_count += 1 if @last_name == "Pirlo" ## Pirlo never misses
    @goal_count += 1 if rand(0..1) == 1 && @last_name != "Pirlo"
  end


  def player_summary
    p "#{@first_name} #{@last_name}'s position is #{@position_side} #{@position}"
    p "#{@first_name} #{@last_name} has #{@shot_count} shots and #{@goal_count} goals"
  end
end

pirlo = SoccerPlayer.new("Andrea", "Pirlo", "midfield")
ronaldo = SoccerPlayer.new("Cristiano", "Ronaldo", "forward", "left")

5.times do pirlo.shoot end
pirlo.player_summary

5.times do ronaldo.shoot end
ronaldo.player_summary


