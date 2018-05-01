require "./spec_helper"

describe Ejabberd do
  describe "#add_rosteritem" do
    it "add an item to a user's roster" do
      user = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.register(user, "localhost", "password")
      res = ejabberd.add_rosteritem(user, "localhost", "alice", "localhost", "alice", "friends", "both")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#backup" do
    it "store the database to backup file" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.backup("/var/lib/database.backup")
      res.status_code.to_s.should eq "200"
    end
  end

  describe "#ban_account" do
    it "ban an account and provide reason" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.ban_account("", "localhost", "for spamming others")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#change_password" do
    it "change the password of an account" do
      user = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.register(user, "localhost", "hello")
      res = ejabberd.change_password(user, "localhost", "new_pass")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#change_room_option" do
    it "change an option in a MUC room" do
      room = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.create_room(room, "localhost", "localhost")
      res = ejabberd.change_room_option(room, "localhost", "members_only", "true")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#check_account" do
    it "check if an account exists or not" do
      user = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.register(user, "localhost", "hello")
      res = ejabberd.check_account(user, "localhost")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#check_password" do
    it "check if a password is correct" do
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      res = ejabberd.check_password("gh", "localhost", "localhost")
      res.status_code.to_s.should eq "200"
      res.body.to_s.should eq "0"
    end
  end

  describe "#check_password_hash" do
    it "check if the password hash is correct" do
      user = Random::Secure.hex(2)
      ejabberd = Ejabberd.new api_url: "localhost:5280"
      ejabberd.register(user, "localhost", "hello")
      res = ejabberd.check_password_hash(user, "localhost", "5d41402abc4b2a76b9719d911017c592", "md5")
      res.status_code.to_s.should eq "200"
    end
  end
end