# Fastly Movie Review Site

This project contains a small React + Vite static site for movie and TV reviews, served through Fastly and backed by an AWS S3 origin bucket.

## Required GitHub repository secrets

Add these in GitHub under:

Settings → Secrets and variables → Actions → New repository secret

Required values:

- `FASTLY_API_TOKEN` — Fastly API token used by the Terraform Fastly provider
- `AWS_ACCESS_KEY_ID` — IAM access key for the AWS account that manages the S3 bucket
- `AWS_SECRET_ACCESS_KEY` — matching AWS secret key
- `AWS_SESSION_TOKEN` — only needed if your AWS credentials are temporary/session-based

Optional but often useful:

- `AWS_DEFAULT_REGION` — set to the region where the S3 bucket is created, such as `us-east-1`

## Local development

```bash
npm install
npm run dev
```

## Production build

```bash
npm run build
```

## Terraform flow

This repo now uses the S3-first architecture:

1. provision the S3 bucket and static website configuration with Terraform
2. upload the built site assets to S3
3. point the Fastly service at the S3 origin and enforce the domain redirect rules

The AWS bucket lifecycle is isolated in `infra/s3`, while the Fastly CDN configuration remains in `infra/fastly`.

## Domain and redirect

- primary hostname: `www.mohnishlad.com`
- apex redirect: `mohnishlad.com` → `https://www.mohnishlad.com`

## Notes

This is a static, low-cost deployment model designed around AWS S3 for hosting and Fastly for CDN + edge rules.
