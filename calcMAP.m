% compute mean average precision (MAP)
function [MAP] = calcMAP (orderH, neighbor)

  [Q, N] = size(neighbor);
  pos = 1: 1000;
  %pos = [1: 10000];
  MAP = 0;
  numSucc = 0;
  for i = 1: Q
    ngb = neighbor(i, orderH(i, :));
    ngb = ngb(pos);
    nRel = sum(ngb);
    if nRel > 0
      prec = cumsum(ngb) ./ pos;
      %ap = mean(prec(ngb));
      %size(prec(ngb))
      %ap = mean(prec(ngb));
      ap = sum(prec(ngb))/1000.;
      MAP = MAP + ap;
      numSucc = numSucc + 1;
    end
	% ngb = neighbor(i, orderH(i, :));
	% nRel = sum(ngb);
	% ngb= ngb(1:10000);
    
    % if nRel > 0
      % prec = cumsum(ngb) ./ pos;
      % ap = mean(prec(ngb));
      % MAP = MAP + ap;
      % numSucc = numSucc + 1;
    % end
  end
  MAP = MAP / numSucc;
  succRate = numSucc / Q;
  
  MAP = MAP*succRate;

end