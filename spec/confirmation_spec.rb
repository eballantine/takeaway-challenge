require 'confirmation'

describe Confirmation do
  let(:test_subject) { instance_double('confirmation', sms_sent: false) }

  describe '#send_sms' do
    it 'should provide a expected delivery time' do 
      expect(subject.expected_delivery_time).to_not be_nil
    end

    it 'should include a message of thanks' do
      expect(subject.construct_body).to include("Thank you")
    end

    it 'sends a text to customer when order is placed' do
      allow(test_subject).to receive(:send_sms).and_return(true)
      expect(test_subject.send_sms).to eq true
    end
  end
end
