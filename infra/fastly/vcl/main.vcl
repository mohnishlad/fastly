include "redirects";
include "static_cache";

sub vcl_recv {
  call custom_redirects;
  call custom_static_cache;

  if (req.method != "GET" && req.method != "HEAD" && req.method != "PUT" && req.method != "POST" && req.method != "PATCH" && req.method != "DELETE" && req.method != "OPTIONS") {
    return (pipe);
  }

  if (req.http.Authorization || req.http.Cookie) {
    return (pass);
  }

  return (hash);
}

sub vcl_backend_response {
  call custom_backend_cache_tuning;
}

sub vcl_deliver {
  call custom_cache_headers;

  if (obj.hits > 0) {
    set resp.http.X-Cache = "HIT";
  } else {
    set resp.http.X-Cache = "MISS";
  }
}
