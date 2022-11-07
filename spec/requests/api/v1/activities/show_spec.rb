describe 'GET api/v1/activities/:id', type: :request do
  let(:user) { create(:user) }
  let(:activity) { create(:activity, user:) }
  let(:id) { activity.id }

  subject do
    get api_v1_activities_path + "/#{id}", headers: auth_headers, as: :json
  end

  it_behaves_like 'there must not be a Set-Cookie in Header'

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'returns activity data' do
    subject
    expect(json[:activity][:id]).to eq(activity.id)
    expect(json[:activity][:title]).to eq(activity.title)
  end

  context 'when record is not found' do
    let(:id) { activity.id + 100 }

    it 'return status 404 not found' do
      subject

      expect(response).to have_http_status(:not_found)
    end
  end
end
