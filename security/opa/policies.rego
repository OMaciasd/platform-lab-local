package example.authz

allow {
  input.method == "GET"
  input.path == "/public"
}

allow {
  input.method == "POST"
  input.path == "/private"
  input.user == "admin"
}

deny[reason] {
  not allow
  reason = "Access Denied"
}
