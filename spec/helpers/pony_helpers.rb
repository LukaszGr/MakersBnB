def dont_send_email
  allow(Pony).to receive(:deliver)
end
