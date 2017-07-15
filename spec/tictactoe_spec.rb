require_relative '../lib/tictactoe.rb'

describe 'TicTacToe' do

  let(:game) {TicTacToe.new(:X, :O)}
  let(:game_reverse) {TicTacToe.new(:O, :X)}
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
    game.place('O', p0x1)
    game.place('X', p0x2)
    game.place('O', p1x0)
    game.place('X', p2x1)
    game.place('O', p1x2)
    game.place('X', p2x0)
    if game.token == game.previous_token
      expect(game.token == game.previous_token).to raise_error("This cell is already occupied")
    end
  end

  it 'should alternate between players' do 
    game.place('X', p0x0)
    game.place('O', p0x1)
    game.place('X', p0x2) 
    game.place('O', p1x0)
    game.place('X', p1x1)
    game.place('O', p1x2)
    game.place('X', p2x0)
    game.place('O', p2x1)
    game.place('X', p2x2)
    if game.token == game.previous_token
      expect(game.token == game.previous_token).to raise_error("same token repeated")
    end

  end

  it 'should not allow a player to play twice' do
    token = game.place('X', p0x2)
    previous_token = game.place('O', p0x1)
    if token == previous_token
      expect(token == previous_token).to raise_error("same token repeated")
    end
  end

  it 'should not allow player 2 to play first' do
    if game.first_player == :X
      expect(game.is_empty?).to eq(false)
      expect(game.first_player).to eq(:X)
      expect(game.second_player).not_to eq(:X)
      game.place('X', p2x2)
      expect(game.board[p2x2[:x]][p2x2[:y]]).to eq('X')
      expect(game.board[p2x2[:x]][p2x2[:y]]).not_to eq('O')
    else
      expect(game_reverse.is_empty?).to eq(false)
      expect(game_reverse.first_player).to eq(:O)
      expect(game_reverse.second_player).not_to eq(:O)
      game.place('O', p2x2)
      expect(game.board[p2x2[:x]][p2x2[:y]]).to eq('O')
      expect(game.board[p2x2[:x]][p2x2[:y]]).not_to eq('X')
    end
  end

  context 'Win Scenarios' do
    it 'should declare winner when 3 of his tokens are placed horizontally' do
      game.place('X', p0x0)
      game.place('O', p1x1)
      game.place('X', p0x2)
      game.place('O', p2x1)
      game.place('X', p0x1)
      game.horizontal_order_winning

    end
    it 'should declare winner when 3 of his tokens are placed vertically'
    it 'should declare winner when 3 of his tokens are placed diagonally'
  end

  context 'Draw Scenario' do
    it 'should declare draw when there are no free cells and there is no winner'
  end

end