module OmniauthMocks
  def request_omniauth_mock
    OmniAuth.config.mock_auth[:auth] = OmniAuth::AuthHash.new({
      provider: "google_oauth2",
      uid: "100000000000000000000",
      info: {
        name: "John Smith",
        email: "john@example.com",
        first_name: "John",
        last_name: "Smith",
        image: "https://lh4.googleusercontent.com/photo.jpg",
        url: {
          google: "https://plus.google.com/+JohnSmith"
        }          
      }                
    })
  end
end