rain_traj = importdata('rain_data.txt');
overcast_traj = importdata('overcast_data.txt');
night_traj = importdata('night_data.txt');

rain_idx = rain_traj(:,1);
overcast_idx = overcast_traj(:,1);
night_idx = night_traj(:,1);

rain_3d = rain_traj(:,2:4);
overcast_3d = overcast_traj(:,2:4);
night_3d = night_traj(:,2:4);

rain_truth = importdata('rain_truth.csv');
overcast_truth = importdata('overcast_truth.csv');
night_truth = importdata('night_truth.csv');

rain_truth = rain_truth(:,3:5);
overcast_truth = overcast_truth(:,3:5);
night_truth = night_truth(:,3:5);

[m n] = size(rain_truth);
rain_truth_3d = rain_truth;
for i = 1 : m
    for j = 1 : i-1
        rain_truth_3d(i,:) = rain_truth_3d(i,:) + rain_truth(j,:);
    end
end

[m n] = size(overcast_truth);
overcast_truth_3d = overcast_truth;
for i = 1 : m
    for j = 1 : i-1
        overcast_truth_3d(i,:) = overcast_truth_3d(i,:) + overcast_truth(j,:);
    end
end

[m n] = size(night_truth);
night_truth_3d = night_truth;
for i = 1 : m
    for j = 1 : i-1
        night_truth_3d(i,:) = night_truth_3d(i,:) + night_truth(j,:);
    end
end

rain_truth_3d = rain_truth_3d(rain_idx,:);
overcast_truth_3d = overcast_truth_3d(overcast_idx,:);
night_truth_3d = night_truth_3d(night_idx,:);

csvwrite('r_truth.csv',rain_truth_3d);
csvwrite('o_truth.csv',overcast_truth_3d);
csvwrite('n_truth.csv',night_truth_3d);

rain_3d(:,1) = rain_3d(:,1)*(rain_truth_3d(end,1)/rain_3d(end,1));
rain_3d(:,2) = rain_3d(:,2)*(rain_truth_3d(end,2)/rain_3d(end,2));
rain_3d(:,3) = rain_3d(:,3)*(rain_truth_3d(end,3)/rain_3d(end,3));

overcast_3d(:,1) = overcast_3d(:,1)*(overcast_truth_3d(end,1)/overcast_3d(end,1));
overcast_3d(:,2) = overcast_3d(:,2)*(overcast_truth_3d(end,2)/overcast_3d(end,2));
overcast_3d(:,3) = overcast_3d(:,3)*(overcast_truth_3d(end,3)/overcast_3d(end,3));

night_3d(:,1) = night_3d(:,1)*(night_truth_3d(end,1)/night_3d(end,1));
night_3d(:,2) = night_3d(:,2)*(night_truth_3d(end,2)/night_3d(end,2));
night_3d(:,3) = night_3d(:,3)*(night_truth_3d(end,3)/night_3d(end,3));

csvwrite('r_data.csv',rain_3d);
csvwrite('o_data.csv',overcast_3d);
csvwrite('n_data.csv',night_3d);