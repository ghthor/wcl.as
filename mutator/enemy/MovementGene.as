package mutator.enemy {
	import wcl.math.Vector2D;
	
	/**
	 * ...
	 * @author ...
	 */
	public class MovementGene implements Gene {
		
		public var movement:Vector2D
		
		const MAX_SPEED:Number = 200
		
		public function MovementGene() {
		}
		
		/* INTERFACE mutator.enemy.Gene */
		
		public function executeOn(enemy:EnemyShip){
			//enemy.x += movement.x
			//enemy.y += movement.y
			enemy.velocity = movement
		}
		
	}
}