require_relative '../lib/tictactoe.rb'

describe 'TicTacToe' do

  let(:game) {TicTacToe.new(:X, :O)}
  let(:place) {Position.new()}
  let(:p0x0) {place.position(0,0)}
  let(:p0x1) {place.position(0,1)}
  let(:p0x2) {place.position(0,2)}
  let(:p1x0) {place.position(1,0)}
  let(:p1x1) {place.position(1,1)}
  let(:p1x2) {place.position(1,2)}
  let(:p2x0) {place.position(2,0)}
  let(:p2x1) {place.position(2,1)}
  let(:p2x2) {place.position(2,2)}
 
  it 'should assign tokens to players' do
    game = TicTacToe.new(:X, :O)
    expect(game.first_player).to be(:X)
    expect(game.second_player).to be(:O)
  end

  it 'should not allow tokens to be same' do
    expect {game = TicTacToe.new(:X, :X)}.to raise_error("Tokens cannot be the same.")
  end

  it 'should allow placing a token in a cell' do
    game.place('X', p0x0)
    expect(game.board[p0x0[:x]][p0x0[:y]]).to eq('X')
  end

  it 'should not allow placing token in a occupied cell' do

  end

  it 'should alternate between players'
  it 'should not allow a player to play twice'
  it 'should not allow player 2 to play first'

  context 'Win Scenarios' do
    it 'should declare winner when 3 of his tokens are placed horizontally'
    it 'should declare winner when 3 of his tokens are placed vertically'
    it 'should declare winner when 3 of his tokens are placed diagonally'
  end

  context 'Draw Scenario' do
    it 'should declare draw when there are no free cells and there is no winner'
  end

end