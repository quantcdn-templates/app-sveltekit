<script lang="ts">
	import type { PageData } from './$types';

	let { data }: { data: PageData } = $props();
</script>

<main>
	<div class="container">
		<header>
			<h1>SvelteKit on Quant Cloud</h1>
			<p class="subtitle">Server-Side Rendered Application</p>
		</header>

		<section class="info-card">
			<h2>Server Information</h2>
			<dl>
				<dt>Hostname</dt>
				<dd>{data.host}</dd>

				<dt>Node.js Version</dt>
				<dd>{data.nodeVersion}</dd>

				<dt>Platform</dt>
				<dd>{data.platform}</dd>

				<dt>Port</dt>
				<dd>{data.port}</dd>

				<dt>Server Time</dt>
				<dd>{data.timestamp}</dd>
			</dl>
		</section>

		<section class="info-card">
			<h2>API Endpoint</h2>
			<p>Test the API endpoint at <a href="/api/hello">/api/hello</a></p>
		</section>

		<footer>
			<p>
				Deployed with <a href="https://www.quantcdn.io" target="_blank" rel="noopener">Quant Cloud</a>
			</p>
		</footer>
	</div>
</main>

<style>
	main {
		min-height: 100vh;
		display: flex;
		align-items: center;
		justify-content: center;
		padding: 2rem;
	}

	.container {
		max-width: 600px;
		width: 100%;
	}

	header {
		text-align: center;
		margin-bottom: 2rem;
	}

	h1 {
		color: #ff3e00;
		font-size: 2.5rem;
		margin: 0 0 0.5rem 0;
	}

	.subtitle {
		color: #666;
		font-size: 1.1rem;
		margin: 0;
	}

	.info-card {
		background: white;
		border-radius: 8px;
		padding: 1.5rem;
		margin-bottom: 1.5rem;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}

	.info-card h2 {
		color: #333;
		font-size: 1.25rem;
		margin: 0 0 1rem 0;
		padding-bottom: 0.5rem;
		border-bottom: 2px solid #ff3e00;
	}

	dl {
		margin: 0;
		display: grid;
		grid-template-columns: auto 1fr;
		gap: 0.5rem 1rem;
	}

	dt {
		font-weight: 600;
		color: #666;
	}

	dd {
		margin: 0;
		font-family: 'SF Mono', Monaco, 'Courier New', monospace;
		color: #333;
	}

	a {
		color: #ff3e00;
		text-decoration: none;
	}

	a:hover {
		text-decoration: underline;
	}

	footer {
		text-align: center;
		color: #666;
		font-size: 0.9rem;
	}

	footer p {
		margin: 0;
	}
</style>
