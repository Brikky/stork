require 'app/models/user.rb'

describe User do
    raw_password = 'password'
  let(:user) do
      User.create(email: 'admin@example.com',
                            password: raw_password,
                            password_confirmation: raw_password})
  end

  it 'has orders' do
    expect(user.orders).not_to raise_error
    expect(user.orders).to be
  end

  it 'has a secure password' do
    expect(user.password).to raise_error
    expect(user.encrypted_password).to be
  end

  it 'password is encrypted on creation' do
    expect(user.encrypted_password).not_to be(raw_password)
  end

  it 'has a first name' do
    expect(user.first_name).not_to raise_error
  end

  it 'has a last name' do
    expect(user.last_name).not_to raise_error
  end

  it 'has a full address' do
    expect(user.full_address).not_to raise_error
  end

  it 'has a street address' do
    expect(user.address).not_to raise_error
  end

  it 'has a city' do
    expect(user.city).not_to raise_error
  end

  it 'has a state' do
    expect(user.state).not_to raise_error
  end

  it 'has a zipcode' do
    expect(user.zipcode).not_to raise_error
  end

  it 'has a valid zipcode' do
    expect(user.zipcode).not_to raise_error
  end
end

describe '#rise_up?' do
  it 'one day will rise up' do
    expect(nation.rise_up?).to be true
  end
end
