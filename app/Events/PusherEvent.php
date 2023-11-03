<?php

namespace App\Events;

use App\Models\Conversation;
use GuzzleHttp\Client;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class PusherEvent implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * Create a new event instance.
     */
    public function __construct(
        protected $sender,
        protected $message,
        protected $receive,
        protected Conversation $conversation
    ) {
        //
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return array<int, \Illuminate\Broadcasting\Channel>
     */
    public function broadcastOn(): array
    {
        new Client([
            'base_uri' => 'https://api-mt1.pusher.com',
            'verify' => false,
        ]);
        return [
            new PrivateChannel('mon-channel'),
        ];
    }

    public function broadcastAs()
    {
        return 'message.envoyer';
    }

    public function broadcastWith()
    {
        return [
            "conversation_id" => $this->conversation->id,
            "sender" => $this->sender,
            "message" => $this->message,
            "receiver" => $this->receive

        ];
    }
}
