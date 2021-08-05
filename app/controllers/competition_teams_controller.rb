class CompetitionTeamsController < ApplicationController

  def create
    @competition = Competition.find(params[:competition_id])
    team = Team.create(nickname: params[:nickname], hometown: params[:hometown])
    CompetitionTeam.create(competition_id: @competition.id, team_id: team.id)
    redirect_to "/competitions/#{@competition.id}"
  end

end
