import type { PageServerLoad } from './$types';
import { env } from '$env/dynamic/private';
import os from 'os';

export const load: PageServerLoad = async () => {
	return {
		host: os.hostname(),
		nodeVersion: process.version,
		platform: process.platform,
		port: env.PORT || '3001',
		timestamp: new Date().toISOString()
	};
};
