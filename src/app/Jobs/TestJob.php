<?php

namespace App\Jobs;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Queue\Queueable;

class TestJob implements ShouldQueue
{
    use Queueable;

    /**
     * Create a new job instance.
     */
    public function __construct()
    {
        \Log::info('TestJob is working!');
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        //
    }
}
