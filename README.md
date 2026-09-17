# Fastly Movie Review Site

This project contains a small React + Vite static site for movie and TV reviews, hosted behind Fastly CDN and backed by Fastly Object Storage.

## Required GitHub repository secrets

Add these in GitHub under:

Settings → Secrets and variables → Actions → New repository secret

Required values:

- `FASTLY_API_TOKEN` — the Fastly API token for the Terraform provider
- `AWS_ACCESS_KEY_ID` — credentials for the AWS S3-compatible object storage bootstrap flow
- `AWS_SECRET_ACCESS_KEY` — matching secret key for the object storage bootstrap flow

The Fastly token is the one you generate from your Fastly account. The AWS values are needed because the Fastly Object Storage guide uses the AWS S3-compatible provider for bucket creation.

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

This repo uses the bootstrap pattern required by the Fastly Object Storage guide:

1. create the Fastly object storage access key
2. use that credential set to provision the bucket with the AWS S3-compatible provider
3. apply the Fastly service + redirect + caching configuration

The workflow in `.github/workflows/deploy-fastly.yml` runs this sequence for PR validation and merge-based deployment.

## Domain and redirect

- primary hostname: `www.mohnishlad.com`
- apex redirect: `mohnishlad.com` → `https://www.mohnishlad.com`

## Notes

This is intentionally a static, low-cost architecture designed for a presentation/demo setup and for Fastly’s free-tier object-storage path.
