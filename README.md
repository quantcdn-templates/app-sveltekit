# SvelteKit on Quant Cloud

A production-ready SvelteKit template with server-side rendering for deployment on Quant Cloud.

[![Deploy to Quant Cloud](https://www.quantcdn.io/img/quant-deploy-btn-sml.svg)](https://dashboard.quantcdn.io/cloud-apps/create/starter-kit/app-sveltekit)

## Features

- SvelteKit with TypeScript
- Server-side rendering using `@sveltejs/adapter-node`
- API routes support
- Docker containerization
- GitHub Actions CI/CD workflow

## Local Development

### Using npm

```bash
npm install
npm run dev
```

The development server will start at http://localhost:5173

### Using Docker

```bash
cp docker-compose.override.yml.example docker-compose.override.yml
docker-compose up --build
```

The application will be available at http://localhost:3000

## Project Structure

```
app-sveltekit/
├── src/
│   ├── app.html              # HTML template
│   ├── app.d.ts              # TypeScript declarations
│   └── routes/
│       ├── +layout.svelte    # Root layout
│       ├── +page.server.ts   # Server-side data loading
│       ├── +page.svelte      # Home page
│       └── api/
│           └── hello/
│               └── +server.ts # API endpoint
├── quant/
│   ├── meta.json             # Template metadata
│   └── entrypoints/          # Custom entrypoint scripts
├── Dockerfile                # Container definition
├── docker-compose.yml        # Production compose config
├── svelte.config.js          # SvelteKit configuration
├── vite.config.ts            # Vite configuration
└── package.json
```

## API Endpoints

- `GET /api/hello` - Returns a greeting with server info
- `POST /api/hello` - Echoes back the posted JSON data

## Deployment

### Automatic Deployment

Push to the `main` branch triggers automatic deployment via GitHub Actions.

Required secrets:
- `QUANT_API_KEY` - Your Quant Cloud API key
- `QUANT_ORGANIZATION` - Your Quant organization slug

### Manual Deployment

Build and push the Docker image:

```bash
docker build -t your-registry/app-sveltekit:latest .
docker push your-registry/app-sveltekit:latest
```

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `PORT` | Application port | `3001` |
| `HOST` | Bind address | `0.0.0.0` |
| `NODE_ENV` | Environment | `production` |

## License

MIT
