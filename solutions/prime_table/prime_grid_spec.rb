require_relative 'prime_grid'

describe PrimeGrid do
  let(:grid) { PrimeGrid.new(gridsize: 10) }
  describe "#gridsize" do
    it "should equal 10" do
      expect(grid.gridsize).to eq(10)
    end
  end
  describe "#is_prime?" do
    it "should return false if the number is not prime" do
      expect(grid.is_prime?(4)).to be false
    end
  end
  describe "#generate_primes_list" do
    it "should generate an array the length of gridsize of prime numbers" do
      expect{grid.generate_primes_list}.to change{grid.prime_list}.from([]).to([2,3,5,7,11,13,17,19,23,29])
    end
  end
  describe "#table" do
    it "should be an object" do
      expect(grid.table).to be_instance_of Terminal::Table
    end
  end
  describe "#add_title" do
    it "should add a title to the table" do
      expect{grid.add_title}.to change{grid.table.title}.from(nil).to("Primes Grid")
    end
  end
  describe "#add_header" do
    before {grid.generate_primes_list}
    it "should add the prime_list to the table as the first row" do
      expect{grid.add_header}.to change{grid.rows}.from([]).to([["",2,3,5,7,11,13,17,19,23,29]])
    end
  end
  describe "#add_solutions" do
    before {grid.generate_primes_list}
    before {grid.add_header}
    it "should generate the solutions rows and add them to the rows array, making the rows array contain 11 nested arrays including the header row." do
      expect{grid.add_solutions}.to change{grid.rows.length}.from(1).to(11)
    end
  end
  describe "#add_rows" do
    before {grid.generate_primes_list}
    before {grid.add_header}
    before {grid.add_solutions}

    it "should take the complete rows array and add those arrays to the table." do
      expect{grid.add_rows}.to change{grid.table.rows.length}.from(0).to(11)
    end
  end
  describe "#print_table" do
    it "should print the table to STDOUT" do
      expect{grid.print_table}.to output{table}.to_stdout
    end
  end
end
