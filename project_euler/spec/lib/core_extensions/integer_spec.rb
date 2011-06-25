require 'spec_helper'
require 'project_euler/core_extensions/integer'


describe Integer do
  describe '#divide?' do
    specify { 5.divide?(0).should         be }
    specify { 5.divide?(1).should_not     be }
    specify { 5.divide?(5).should         be }
    specify { 5.divide?(10).should        be }
    specify { 5.divide?(11).should_not    be }
    specify { 5.divide?(12).should_not    be }
    specify { 5.divide?(13).should_not    be }
    specify { 5.divide?(14).should_not    be }
    specify { 5.divide?(15).should        be }
    specify { 10.divide?(100).should      be }
    specify { 10.divide?(101).should_not  be }
  end
  
  describe '#prime_factors' do
    specify { 2.prime_factors.should == [2] }
    specify { 3.prime_factors.should == [3] }
    specify { 8.prime_factors.should == [2] }
    specify { 84.prime_factors.should == [2, 3, 7] }
  end
  
  describe '#prime_factorization' do
    specify { 2.prime_factorization.should  == [2]        }
    specify { 8.prime_factorization.should  == [2,2,2]    }
    specify { 9.prime_factorization.should  == [3,3]      }
    specify { 15.prime_factorization.should == [3,5]      }
    specify { 84.prime_factorization.should == [2,2,3,7]  }
  end
  
  describe '#digits' do
    sample = [1,2,3,4,5,6,7,8,9,0] * 3
    sample.each_index do |size|
      specify do
        crnt = sample.take(size.next)
        crnt.join.to_i.digits.should == crnt
      end
    end
  end
  
  describe '#prime?' do
    specify { 7.should be_prime }
    specify { 8.should_not be_prime }
  end
  
  describe '#factors' do
    specify 'it should yield factors to a block' do 
      1.factors { |factor| factor.should == 1 }
    end
    
    specify 'it should return an enumerator if no block is given' do
      1.factors.take(1).should == [1]
    end
    
    specify { 1.factors.to_a.should == [1] }
    specify { 2.factors.to_a.should == [1, 2]}
    specify { 10.factors.to_a.should == [1, 2, 5, 10] }
    specify { 36.factors.to_a.should == [1, 2, 3, 4, 6, 9, 12, 18, 36] }
    specify do
      37800.factors.to_a.should == [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14,
        15, 18, 20, 21, 24, 25, 27, 28, 30, 35, 36, 40, 42, 45, 50, 54, 56, 60,
        63, 70, 72, 75, 84, 90, 100, 105, 108, 120, 126, 135, 140, 150, 168, 175,
        180, 189, 200, 210, 216, 225, 252, 270, 280, 300, 315, 350, 360, 378, 420,
        450, 504, 525, 540, 600, 630, 675, 700, 756, 840, 900, 945, 1050, 1080,
        1260, 1350, 1400, 1512, 1575, 1800, 1890, 2100, 2520, 2700, 3150, 3780,
        4200, 4725, 5400, 6300, 7560, 9450, 12600, 18900, 37800
      ]
    end
  end
end