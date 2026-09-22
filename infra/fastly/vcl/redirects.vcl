sub custom_redirects {
  if (req.http.host == "${apex_domain}") {
    error 801;
  }
}

sub vcl_error {
  if (obj.status == 801) {
    set obj.status = 301;
    set obj.http.Location = "https://${domain_name}" + req.url;
    return (deliver);
  }
}
