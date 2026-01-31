<script lang="ts">
	import type { Snippet } from 'svelte';

	let { children }: { children: Snippet } = $props();
</script>

<svelte:head>
	<title>SvelteKit on Quant Cloud</title>
	<meta name="description" content="SvelteKit application deployed on Quant Cloud" />
</svelte:head>

{@render children()}

<style>
	:global(body) {
		margin: 0;
		font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell,
			'Open Sans', 'Helvetica Neue', sans-serif;
		background-color: #f5f5f5;
		color: #333;
	}

	:global(*) {
		box-sizing: border-box;
	}
</style>
