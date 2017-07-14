require_relative '../lib/tictactoe.rb'

describe "TicTacToeGame" do

  let(:position) {Position.new}
  let(:p0x0) { position.place(0,0)}
  let(:p0x1) { position.place(0,1)}

  it "should allow only two tokens" do
    TicTacToe.new('X', 'O', 3)
  end

  it "should both tokens are not same" do
    expect{ TicTacToe.new('X', 'O', 3) }.to raise("both token are not same")
  end

  it "should both tokens are same" do
    expect{ TicTacToe.new('O', 'O', 3) }.to raise("both token are same")
  end

  it "should place tokens alternatively" do
    expect{ }
  end

  it "should not place tokens for different places" do
  end

  context "Wining Condition" do

    it 'should same token are placed in horizontally' do
    end

    it 'should same token are placed in vertically' do
    end

    it 'should same token are placed in diagonally' do
    end

  end

  context "Draw Condition" do

    it 'should token placed in all the cells' do
    end

    it 'should not satisfied wining condition' do
    end
    
  end
end