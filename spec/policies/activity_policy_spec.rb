describe ActivityPolicy do
  subject { described_class }

  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let!(:activity1) { create(:activity, user: user1) }

  permissions :show?, :update?, :destroy? do
    it 'denies access if user is not the owner' do
      expect(subject).not_to permit(user2, activity1)
    end

    it 'allows access if user is the owner' do
      expect(subject).to permit(user1, activity1)
    end
  end

  describe 'scope' do
    let(:mock_model) { double('MockModel', where: true) }
    subject { ActivityPolicy::Scope.new(user1, mock_model).resolve }

    it 'shows only user activities' do
      expect(subject).to be(true)
    end
  end
end
