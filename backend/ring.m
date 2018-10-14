function time = ring(settings)
     time = GetSecs;
     Screen('FrameOval',settings.screen.outwindow,settings.draw.ring.color,[(settings.draw.ring.x_loc-settings.draw.ring.radius) (settings.draw.ring.y_loc-settings.draw.ring.radius) (settings.draw.ring.x_loc+settings.draw.ring.radius) (settings.draw.ring.y_loc+settings.draw.ring.radius)],settings.draw.ring.penWidth);
end

