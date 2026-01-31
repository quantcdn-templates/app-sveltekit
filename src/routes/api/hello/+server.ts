import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';
import os from 'os';

export const GET: RequestHandler = async () => {
	return json({
		message: 'Hello from SvelteKit API!',
		host: os.hostname(),
		timestamp: new Date().toISOString()
	});
};

export const POST: RequestHandler = async ({ request }) => {
	const body = await request.json();
	return json({
		message: 'Received your POST request',
		received: body,
		host: os.hostname(),
		timestamp: new Date().toISOString()
	});
};
