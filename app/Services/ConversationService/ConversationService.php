<?php
namespace App\Services\ConversationService;

use App\Models\Conversation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ConversationService
{
    protected $__request;

    public function __construct(Request $request)
    {
        $this->__request = $request;
    }

    public function createConversation(){

        $conversation = Conversation::create([
            'user_create' => Auth::user()->id,
            'user_choose' => $this->__request->choose_recepteur
        ]);

        $conversation->conversation()->create(
            [
                'sender_id' => Auth::user()->id,
                'content' => $this->__request->message
            ]
        );

        dd("conve");
        // return $Conversation;
    }
}
