<?php

namespace App\Services\Pusher;

use Exception;
use Pusher\Pusher;
use GuzzleHttp\Client;
use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class PusherServices
{
    private $pusher;

    public function __construct()
    {
        $auth_key = config('broadcasting.connections.pusher.key');

        if (is_null($auth_key)) {
            throw new Exception("Pusher auth_key is not set.");
        }

        $options = [
            'cluster' => config('broadcasting.connections.pusher.options.cluster'),
            'encrypted' => true
        ];

        $guzzleClient = new Client([
            'verify' => '../' // Replace with the path to the downloaded cacert.pem file
        ]);

        $this->pusher = new Pusher(
            $auth_key,
            config('broadcasting.connections.pusher.secret'),
            config('broadcasting.connections.pusher.app_id'),
            $options,
            $guzzleClient
        );
    }

    public function sendChatMessage($user_send, $message, $user_receive)
    {
        $data = array(
            'user' => $user_send,
            'message' => $message,
            "user_receive" => $user_receive,
            'timestamp' => time()
        );

        return $this->pusher->trigger('my-channel', 'my-event', $data);
    }
}
