describe User do
  let(:subject) { create(:user, email: 'user@example.com') }

  describe "#email" do
    it "returns a string" do
      expect(subject.email).to match "user@example.com"
    end
  end

  describe "#total_score" do
    let!(:score_1) { create(:score, user: subject, stableford: 32) }
    let!(:score_2) { create(:score, user: subject, stableford: 34) }

    context "user has 2 scores" do
      it "returns the total of the scores" do
        expect(subject.total_score).to eq 66
      end
    end

    context "user has 4 scores" do
      let!(:score_3) { create(:score, user: subject, stableford: 36) }
      let!(:score_4) { create(:score, user: subject, stableford: 30) }

      it "returns the total of the scores" do
        expect(subject.total_score).to eq 102
      end
    end
  end

end
