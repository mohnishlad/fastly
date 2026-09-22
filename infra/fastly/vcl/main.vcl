include "redirects";
include "static_cache";

#FASTLY recv
sub vcl_recv {
  call custom_redirects;
  call custom_static_cache;

  if (req.method != "GET" && req.method != "HEAD" && req.method != "PUT" && req.method != "POST" && req.method != "PATCH" && req.method != "DELETE" && req.method != "OPTIONS") {
    return (pass);
  }

  if (req.http.Authorization || req.http.Cookie) {
    return (pass);
  }

  return (hash);
}

#FASTLY error
sub vcl_error {
  if (obj.status == 801) {
    set obj.status = 301;
    set obj.http.Location = "https://${domain_name}" + req.url;
    return (deliver);
  }
}

#FASTLY fetch
sub vcl_backend_response {
  call custom_backend_cache_tuning;
}

#FASTLY deliver
sub vcl_deliver {
  call custom_cache_headers;

  if (obj.hits > 0) {
    set resp.http.X-Cache = "HIT";
  } else {
    set resp.http.X-Cache = "MISS";
  }
}
